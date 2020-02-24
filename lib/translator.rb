# require modules here
require 'yaml'

def load_library(file)
  emot_hashes = {'get_meaning' => {}, 'get_emoticon' => {}}
  YAML.load_file(file).each do |meaning, value|
    eng = value[0]
    jap = value[1]
    emot_hashes['get_meaning'][jap] = meaning
    emot_hashes['get_emoticon'][eng] = jap
  end
  emot_hashes
end

def get_japanese_emoticon(file, emoticon)
  source = load_library(file)
  if source["get_emoticon"][emoticon] == nil
    "Sorry, that emoticon was not found"
  else
    source["get_emoticon"][emoticon]
  end
end

def get_english_meaning(file, emoticon)
  source = load_library(file)
  if source["get_meaning"][emoticon] == nil
    "Sorry, that emoticon was not found"
  else
    source["get_meaning"][emoticon]
  end
end