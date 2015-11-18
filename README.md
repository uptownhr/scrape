#Scraper
Simple scraper based on json definitions

##examples

```
it('accepts css selector and returns selected elements', async (done) => {
    let $ = await Scraper('http://www.startuptabs.com', 'head title')

    $.should.be.a('object')
    $.length.should.eq(1)
    $.text().should.contain('Startuptabs')
    done()
  })

it('accepts multiple parameter bound css selectors, returns object mapped to param', async (done) => {

    let $ = await Scraper('http://www.startuptabs.com', {
      title: 'head title',
      img: '.title-area img'
    })

    $.title.text().should.contain('Startuptabs')
    $.img.attr('src').should.contain('startuptabs')
    done()
})

it('returns array of elements if multiple selected', async (done) => {

    let $ = await Scraper('http://www.startuptabs.com', {
      sections: '.footer a'
    })

    $.sections.length.should.be.gt(3)
    done()
})

it('can define selector method and get value instead of element', async (done) => {

    let $ = await Scraper('http://www.startuptabs.com', {
      sections: {
        selector: '.footer a',
        method: 'attr',
        value: 'href'
      },
      test: {
        selector: '.footer a',
        method: 'text'
      }
    })

    $.sections.length.should.be.gt(3)

    $.sections.forEach( section => {
      section.should.be.a('string')
    })

    $.test.forEach( section => {
      section.should.be.a('string')
    })
    done()
  })

it('can do nested mapping', async (done) => {
    let $ = await Scraper('http://www.startuptabs.com', {
      sections: {
        selector: '.footer a',
        mapping: {
          link: {
            method: 'attr',
            value: 'href'
          },
          text: {
            method: 'text'
          }
        }
      },
      sections2: {
        selector: '.footer a',
        mapping: {
          link: {
            method: 'attr',
            value: 'href'
          },
          text: {
            method: 'text'
          }
        }
      }
    })

    $.sections.length.should.be.gt(3)
    $.sections2.length.should.be.gt(3)

    $.sections.forEach( section => {
      section.link.should.be.a('string')
    })

    done()
  })

it('can do a single nested map', async (done) => {

    let $ = await Scraper('http://www.startuptabs.com', {
      selector: '.footer a',
      mapping: {
        link: {
          method: 'attr',
          value: 'href'
        },
        text: {
          method: 'text'
        }
      }
    })

    $.length.should.be.gt(3)

    $.forEach( section => {
      section.link.should.be.a('string')
    })
    done()
  })

it('can get articles from http://www.sensefinity.com/news/', async (done) => {
    let articles = await Scraper('http://www.sensefinity.com/news/', {
      selector: 'article .content-inner > a',
      mapping: {
        link: {
          method: 'attr',
          value: 'href'
        },
        text: {
          method: 'text'
        }
      }
    })

    articles.length.should.be.gt(3)
    articles.forEach( article => {
      article.text.should.be.a('string')
    })
    done()
  })

it('can get articles from https://www.userlike.com/en/blog', async (done) => {
    let articles = await Scraper('https://www.userlike.com/en/blog', {
      selector: 'article h2 > a',
      mapping: {
        link: {
          method: 'attr',
          value: 'href'
        },
        text: {
          method: 'text'
        }
      }
    })

    articles.length.should.be.gt(3)
    articles.forEach( article => {
      article.text.should.be.a('string')
    })

    done()
  })

it('can get articles from http://blog.gojobhero.com/', async (done) => {
    let articles = await Scraper('http://blog.gojobhero.com/', {
      selector: '.post-title a',
      mapping: {
        link: {
          method: 'attr',
          value: 'href'
        },
        text: {
          method: 'text'
        }
      }
    })

    articles.length.should.be.gt(3)
    articles.forEach( article => {
      article.text.should.be.a('string')
    })
    done()
  })
```