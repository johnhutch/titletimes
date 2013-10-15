# Make sure the correct instance variables are getting the right values
# Assert things that get end up rendered in HTML

# Basic structure of HTTP method, controller method, optional parameters passed to method
# Call attributes_for to get a hash of attributes (not an object)

require 'spec_helper'

describe TitletimesController do

  describe 'GET #index' do
    it "populates an array of all titletimes" do
      titletime1 = create(:random_titletime)
      titletime2 = create(:random_titletime)
      get :index
      # expect(assigns(:titletimes)).to match_array([titletime1, titletime2])
    end
    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it "assigns the requested titletime to @titletime" do
      titletime = create(:titletime)

      # HTTP verb, controller method as symbol, parameters
      get :show, id: titletime

      # assigns checks variables created by the controller method
      expect(assigns(:titletime)).to eq titletime
    end
    it "renders the :show template" do
      titletime = create(:titletime)
      get :show, id: titletime

      # response used to test finished product returned
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "assigns a new Titletime to @titletime"
    it "renders the :new template"
  end

  describe 'GET #edit' do
    it "assigned the requested titletime to @titletime"
    it "renders the :edit template"
  end

  describe 'POST #create' do
    context "with valid attributes" do
      it "saves the new titletime in the database"
      it "redirects to titletimes#show"
    end

    context "with invalid attributes" do
      it "does not save the new contact in the database"
      it "renders the :new template again"
    end
  end

  describe 'PUT #update' do
    context "with valid attributes" do
      it "updates the titletime in the database"
      it "redirects to the changed titletime"
    end

    context "with invalid attributes" do
      it "does not update the titletime"
      it "renders the #edit template"
    end
  end

  describe 'DELETE #destroy' do
    it "deletes the title from the database"
    it "redirects to home page"
  end

end