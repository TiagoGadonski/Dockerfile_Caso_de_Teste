const http = require('http');

const PORT = process.env.PORT || 3000;

const server = http.createServer((req, res) => {
  if (req.url === '/' && req.method === 'GET') {
    const payload = JSON.stringify({ message: 'Servidor Node no ar!' });
    res.writeHead(200, {
      'Content-Type': 'application/json',
      'Content-Length': Buffer.byteLength(payload),
    });
    return res.end(payload);
  }

  res.writeHead(404);
  res.end();
});

server.listen(PORT, () =>
  console.log(`✅ Servidor iniciado em http://localhost:${PORT}`)
);
