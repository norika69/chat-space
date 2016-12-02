require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user){ create(:user) }
  let(:group){ create(:group) }
  let(:message){ create(:message, group_id: group.id, user_id: user.id) }
  let(:user_groups){ { user_id: user.id, group_id: group.id } }

  before do
    # ユーザー作成
    @user = create(:user)
    # サインイン
    sign_in @user
  end

    context "with valid attributes" do
      it "saves the new message in the database" do
        expect {
        post :create, message: attributes_for(:message),id: group.id
        }.to change(Message, :count).by(1)
      end

      it "redirects to groups#show" do
        post :create, message: attributes_for(:message),id: group.id
        expect(response).to redirect_to groups_path
      end

      it "re-renders the :show template" do
        post :create, message: attributes_for(:message, body:""),id: group.id
        expect(response).to render_template :"groups/show"
      end
    end

end
