require "qa-capybara/version"
require "qa-capybara/runner"

module QaCapybara
 
  def self.start!
    QaCapybara::Runner.new(ARGV).start
  end
  
end
