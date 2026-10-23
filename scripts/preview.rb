# Preview only the deliberately public site directory.
require 'webrick'

root = File.expand_path('../site', __dir__)
port = Integer(ARGV.fetch(0, '4173'))
server = WEBrick::HTTPServer.new(
  Port: port,
  BindAddress: '127.0.0.1',
  DocumentRoot: root,
  DirectoryIndex: ['index.html'],
  AccessLog: [],
  MimeTypes: WEBrick::HTTPUtils::DefaultMimeTypes.merge('svg' => 'image/svg+xml')
)
trap('INT') { server.shutdown }
trap('TERM') { server.shutdown }
puts "Preview: http://127.0.0.1:#{port} (serving site/ only)"
server.start
