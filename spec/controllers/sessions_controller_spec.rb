require 'rails_helper'

describe SessionsController do
  describe "GET new" do
    before { get :new }

    it 'returns successful status code' do
      expect(response.status).to be 200
    end

    it 'renders index page' do
      expect(response).to render_template(:new)
    end
  end

  describe "POST create" do
    context "user with right credentials" do
      let!(:user) { create(:user, login: 'abc', password: '123', password_confirmation: '123') }
      before { post :create, login: 'abc', password: '123' }

      it 'sets session' do
        expect(session[:id]).to eq(user.id)
      end

      it 'redirects to sign in page' do
        expect(response.status).to redirect_to(:root)
      end
    end

    context "user with wrong credentials" do
      let!(:user) { create(:user, login: 'abc', password: '123', password_confirmation: '123') }
      before { post :create, login: 'abc', password: '456' }

      it 'sets session' do
        expect(session[:id]).to be_nil
      end

      it 'redirects to sign in page' do
        expect(response.status).to redirect_to(new_session_path)
      end
    end
  end

  describe "GET create" do
    context "user with right credentials" do
      let!(:user) { create(:user, login: 'abc', password: '123', password_confirmation: '123') }
      before { post :create, login: 'abc', password: '123' }

      it 'sets session' do
        expect(session[:id]).to eq(user.id)
      end

      it 'redirects to sign in page' do
        expect(response.status).to redirect_to(:root)
      end
    end

    context "user with wrong credentials" do
      let!(:user) { create(:user, login: 'abc', password: '123', password_confirmation: '123') }
      before { post :create, login: 'abc', password: '456' }

      it 'sets session' do
        expect(session[:id]).to be_nil
      end

      it 'redirects to sign in page' do
        expect(response.status).to redirect_to(new_session_path)
      end
    end
  end
end
