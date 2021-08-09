require 'yaml'

class TestData

  def self.use_data(data, value)
    @config = YAML.load_file('test_data/test_data.yml')
    @config[data][value]
  end
end