require 'rails_helper'

describe MessagesController do
 describe '#create' do

    #メッセージと画像があれば保存できる
    it "is valid with a body, image, group_id, image_id" do
     message = create(:message)
     expect(message).to be_valid
    end
    #メッセージがあれば保存できる
    it "is valid with a body without a image" do
      message = build(:message, image: nil)
      expect(message).to be_valid
    end
    #画像があれば保存できる
    it "is valid with a image without a body" do
      message = build(:message, body: nil)
      expect(message).to be_valid
    end
    #メッセージも画像もない
    it "is invalid without body & image" do
      message = build(:message, body: nil, image:nil)
      message.valid?
      expect(message.errors[:body_or_image]).to include("を入力してください")
    end
    #group_idがない
      it "is invalid without group_id" do
      message = build(:message, group_id:nil)
      message.valid?
      expect(message.errors[:group]).to include("が入力されていません")
    end
    #user_idがない
      it "is invalid without user_id" do
      message = build(:message, user_id:nil)
      message.valid?
      expect(message.errors[:user]).to include("が入力されていません")
  end

  end
end
