require File.dirname(__FILE__) + '/../spec_helper'

describe FckeditorController do

  #Delete this example and add some real ones
  it "should use FckeditorController" do
    controller.should be_an_instance_of(FckeditorController)
  end
  scenario :users, :pages
  test_helper :pages, :page_parts

  integrate_views

  before :each do
    login_as :existing
  end

  it "should allow you to view the command" do
    get :command
    response.should be_success
    assigns(:folders).should == nil
    assigns(:files).should == nil
    assigns(:current_folder).should == nil
    assigns(:folder_url).should == nil    
  end

  xit "should require :CurrentFolder param" do
    get :command, :Type => 'Page'
    response.should be_success
    assigns(:folders).should == nil
    assigns(:files).should == nil
    assigns(:current_folder).should == nil
    assigns(:folder_url).should == nil    
  end

  it "should allow you to view Pages for /" do
    get :command, :Command => 'GetFoldersAndFiles', :Type => 'Page', :CurrentFolder => '/'
    response.should be_success
    assigns(:folders).should ==  ["assorted", "news", "parent", "party"]
    assigns(:files).should ==  {"radius"=>1, "dated"=>1, "virtual"=>1, "draft"=>1, "another"=>1, "assorted"=>1, "first"=>1, "devtags"=>1, "news"=>1, "party"=>1, "parent"=>1, "hidden"=>1, "childless"=>1}
    assigns(:current_folder).should == "#{RAILS_ROOT}/public/uploads/Page/"
    assigns(:folder_url).should == "/uploads/Page/"
  end

  it "should allow you to view Pages for the /parent" do
    get :command, :Command => 'GetFoldersAndFiles', :Type => 'Page', :CurrentFolder => '/parent'
    response.should be_success
    assigns(:folders).should ==  ["child"]
    assigns(:files).should ==  {"child-2"=>1, "child-3"=>1, "child"=>1}
    assigns(:current_folder).should == "#{RAILS_ROOT}/public/uploads/Page/parent"
    assigns(:folder_url).should == "/uploads/Page/parent"
  end

  it "should render url for pages" do
    get :command, :Command => 'GetFoldersAndFiles', :Type => 'Page', :CurrentFolder => '/parent'
    response.body.should =~ /<File name=\"child\" size=\"1\" url=\"\/parent\/child\/\"\/>/
  end

end
