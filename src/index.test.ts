import request from 'supertest'
import server from './index'

describe('GET /', () => {
  afterAll(done => {
    server.close(done)
  })

  it('responds with json containing message and env', async () => {
    const res = await request(server).get('/')
    expect(res.status).toBe(200)
    expect(res.body).toHaveProperty('message')
    expect(res.body).toHaveProperty('env')
    expect(res.body).toHaveProperty('time')
    expect(res.body.message || null).toBe('Hello from demo app')
  })
})
