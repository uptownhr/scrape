"use strict";
const extend = require('extend'),
  rp = require('request-promise'),
  cheerio = require('cheerio'),
  _ = require('lodash')

async function scrape(params){
  let result,
    uri = params.uri,
    body = await rp(uri)

  let $ = cheerio.load(body)

  return params.select? $(params.select) : $
}

async function Scraper(uri, select){
  let res,
    body = await rp(uri),
    $ = cheerio.load(body)

  if(typeof select === 'object'){
    res = map($, select)

  }else if(typeof select == 'string'){
    res = $(select)
  }else{
    res = $
  }

  return res
}

function map($, mapping){
  let response = {}

  if( typeof mapping.mapping != 'undefined' ){
    response = []

    $(mapping.selector).each( (index,item) => {
      let mapped = map($(item), mapping.mapping)
      response.push( mapped )
    })
    return response
  }

  for(let key in mapping){
    let selector = mapping[key]

    if( typeof selector.mapping != 'undefined' ){
      $(selector.selector).each( (index,item) => {
        let mapped = map($(item), selector.mapping)
        if( typeof response[key] == 'undefined' ){
          response[key] = []
        }

        response[key].push( mapped )
      })

    }else{
      if( typeof selector == 'object' ){
        let res = []
        if( typeof selector.selector != 'undefined' ){
          $(selector.selector).each( (index, item) => {
            res.push( $(item)[selector.method](selector.value) )
          })
        }else{
          res = $[selector.method](selector.value)
        }

        response[key] = res
      }else{
        response[key] = $(mapping[key])
      }
    }
  }

  return response
}

module.exports = Scraper