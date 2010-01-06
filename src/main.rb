require 'java'

$LOAD_PATH << File.expand_path(File.dirname(__FILE__))
$LOAD_PATH << File.expand_path(File.join(File.dirname(__FILE__), 'game_objects'))
$LOAD_PATH << File.expand_path(File.join(File.dirname(__FILE__), 'managers'))
$LOAD_PATH << File.expand_path(File.join(File.dirname(__FILE__), 'states'))

# only when running in non-standalone
if File.exist? File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'java'))
  jar_glob = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'java', '*.jar'))
  Dir.glob(jar_glob).each do |jar|
    $CLASSPATH << jar
  end
end
%w{behaviors game_objects input_helpers input_mappings states}.each do |dir|
  $LOAD_PATH << "src/#{dir}"
end

require 'jemini'

begin
  # Change :HelloState to point to the initial state of your game
  game = Jemini::Game.new :title => 'Dukes of Floyd',
                          :screen_size => Vector.new(800, 600),
                          :initial_state => :PlayState,
                          :fullscreen => false
  game.app
rescue => e
  warn e
  warn e.backtrace
end
