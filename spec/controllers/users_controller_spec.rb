require 'rails_helper'

describe UsersController do
  describe "GET new" do
    before { get :new }

    it "builds new user as @user" do
      expect(assigns(:user)).to be_kind_of(User)
    end

    it 'returns successful status code' do
      expect(response.status).to be 200
    end

    it 'renders index page' do
      expect(response).to render_template(:new)
    end
  end

  describe "GET create" do
    context "user is valid" do
      before { get :create, { user: { login: 'abc', password: '123', password_confirmation: '123' } } }

      it 'saves' do
        expect(User.count).to eq(1)
      end

      it 'redirects to root page' do
        expect(response.status).to redirect_to(:root)
      end
    end

    context "user is invalid" do
      before do
        request.env["HTTP_REFERER"] = "back"
        get :create, { user: { login: 'abc', password: '123', password_confirmation: '456' } }
      end

      it 'saves' do
        expect(User.count).to eq(0)
      end

      it 'redirects to root page' do
        expect(response.status).to redirect_to("back")
      end
    end
  end
end
