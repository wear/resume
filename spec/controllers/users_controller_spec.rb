require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

#include AuthenticatedTestHelper 

describe UsersController do
  fixtures :users    
  
  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
  end
  
  it 'allows signup' do
     lambda do
       create_user
       response.should be_redirect      
     end.should change(User, :count).by(1)
   end
   
   it 'will send activation code' do
     create_user
     ActionMailer::Base.deliveries.size.should == 1
   end
   
   it 'can get invitation code' do
     get :new,{:invitation_code => 'abc' }  
     session[:invitation_code].should == 'abc'
   end  
   
  def create_user(options = {}, other_options = {})
    post :create, {:user => {
      :email                 => 'jsy28@163.com',
      :password              => 'zzzzzz',
      :password_confirmation => 'zzzzzz',
      :login            => 'jiangshuyun'
    }.merge(options)}.merge(other_options)
  end     
  
  teardown do
    ActionMailer::Base.deliveries.clear
  end
  
end
