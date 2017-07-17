require 'rails_helper'

describe MessagesController, type: :controller  do
     let(:user){ create(:user) }
     let(:group){ create(:group)}
     let(:message){ build(:message, user: user, group: group)}
  #indexアクション
  describe 'GET#index' do
     context "when user log_in" do

     before do
      login_user user
      get :index, params: {group_id: group}
     end
        it "is assigns @message" do
          expect(assigns(:message)).to be_a_new(Message)
        end
        it "is assigns @group" do
          expect(assigns(:group)).to eq(group)
        end
        it "assigns the requested contact to @groups" do
          groups = user.groups
          expect(assigns(:groups)).to eq groups
        end
        it "is assigns the requested contact to @messages" do
          messages = group.messages
          expect(assigns(:messages)).to eq messages
        end
        it "renders index template?" do
          expect(response).to render_template :index
        end
      end   
    end
  describe "POST#create" do

     before do
      login_user user
     end

     context "when user log_in & create success" do
        #ログインしているかつ、保存に成功した場合
         it "can create message" do
          expect {
            post :create, params: { message: attributes_for(:message), group_id: group.id }
          }.to change(Message, :count).by(1)
         end

         it "is redirect to group_messages_path" do
          expect do
          post :create, params: { message: attributes_for(:message), group_id: group.id }
            expect(response).to redirect_to  group_messages_path
           end
         end
      end
      context "when user log_in & not create success" do
         it "can not create message" do
            expect {
            post :create, params: { message: attributes_for(:message,body: nil, image: nil), group_id: group.id }
            }.not_to change(Message, :count)
         end
        it "is redirect to index" do
            post :create, params: { message: attributes_for(:message, body: nil, image: nil), group_id: group.id }
            expect(response).to render_template :index
        end
     end
  end
end