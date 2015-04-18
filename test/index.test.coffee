request = require('supertest')
app = require('../server');

describe 'Index Page', ->
  it 'renders successfully', (done) ->
    request(app).get('/').expect(200, done)