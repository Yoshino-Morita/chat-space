require 'rails_helper'

describe MessagesController, type: :controller  do
     let(:user){ create(:user) }
     let(:group){ create(:group)}
     let(:message){ build(:message, user: user, group: group)}
  #indexアクション
  describe 'GET#index' do
     context 'when user log_in' do

     before do
      login_user user
      get :index, params: {group_id: group}
     end
        it"is assigns @message" do
        
        expect(assigns(:message)).to be_a_new(Message)
        end
        it"is assigns @group" do
          expect(assigns(:group)).to eq(group)
        end
        it"assigns the requested contact to @groups"do
          group = user.groups.first
          get :index, params: { group_id: group.id }
          groups = user.groups
          expect(assigns(:groups)).to eq groups
        end
        
        #@messages
        it"is assigns the requested contact to @messages"do
        messages = group.messages
        expect(assigns(:messages)).to eq messages
        end
        #ビューへの遷移
       it"renders index template?"do
       get :index, params: {group_id: group}
       expect(response).to render_template :index
       end
     end   
   end
  describe 'POST#create' do

     before do
     login_user user
     end

     context 'when user log_in' do
        #ログインしているかつ、保存に成功した場合
       it'can create message'do
        expect {
          post :create, params: { message: attributes_for(:message), group_id: group.id }
        }.to change(Message, :count).by(1)
       end

       it"is redirect to group_messages_path"do
        expect do
        post :create, params: { message: attributes_for(:message), group_id: group.id }
          expect(response).to redirect_to  group_messages_path
         end
       end
         #ログインしているが、保存に失敗した場合
       it'can not create message'do
          expect {
          post :create, params: { message: attributes_for(:message,body: nil, image: nil), group_id: group.id }
          }.to change(Message, :count).by(0)
       end
        it"is redirect to index"do
          post :create, params: { message: attributes_for(:message,text: nil, image: nil), group_id: group.id }
          groups = create_list(:group, 3)
          get :index, params: { group_id: group.id }
          groups = user.groups
          messages = group.messages
          expect(response).to render_template :index
     end
   end

 end
end