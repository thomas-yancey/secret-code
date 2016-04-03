require "rails_helper"

describe TemplatesController do

  context "#index" do
    let(:user){FactoryGirl.create :user}
      it "should allow a logged-in user to view the list of templates" do
        sign_in
        get :index
        expect(assigns(:templates)).to eq Template.all
      end

    it "should not allow users to view the index without logging in" do
      sign_in nil
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  context "#show" do
    it "should allow a logged-in user to view a specific template" do
      sign_in
      template = Template.create(title: "Yo", preview_url: "yo.com", content: "Hello world")
      get :show, id: template.id
      expect(assigns(:template)).to eq template
    end

    it "should not allow users to view a template without logging in" do
      sign_in nil
      template = Template.create(title: "Yo", preview_url: "yo.com", content: "Hello world")
      get :show, id: template.id
      expect(response).to redirect_to(new_user_session_path)
    end
  end

end
