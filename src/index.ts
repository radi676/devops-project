
import http from 'http'

const PORT = (typeof process.env.PORT === 'string' && process.env.PORT.trim() !== '')
	? Number(process.env.PORT)
	: 3000

const server = http.createServer((req, res) => {
	res.writeHead(200, { 'Content-Type': 'application/json' })
	res.end(
		JSON.stringify({
			message: 'Hello from demo app',
						env: (typeof process.env.NODE_ENV === 'string' && process.env.NODE_ENV.trim() !== '')
							? process.env.NODE_ENV
							: 'development',
			time: new Date().toISOString()
		})
	)
})

server.listen(PORT, () => {
	// eslint-disable-next-line no-console
	console.log(`App listening on http://localhost:${PORT}`)
})

export default server

