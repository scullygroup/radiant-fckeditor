require File.dirname(__FILE__) + '/../spec_helper'

describe FckeditorHelper do
  
  it "should not include the FckeditorHelper" do
    included_modules = self.metaclass.send :included_modules
    included_modules.should_not include(FckeditorHelper)
  end
  
end
