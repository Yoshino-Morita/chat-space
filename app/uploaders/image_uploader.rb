class ImageUploader < CarrierWave::Uploader::Base

  # リサイズしたり画像形式を変更するのに必要
  include CarrierWave::MiniMagick
  # 画像の上限を700pxにする
  process :resize_to_limit => [200, 200]

  # 保存形式をJPGにする
  process :convert => 'jpg'

  # サムネイルを生成する設定
  version :thumb do
    process :resize_to_limit => [200, 200]
  end

  # jpg,jpeg,gif,pngしか受け付けない
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # 拡張子が同じでないとGIFをJPGとかにコンバートできないので、ファイル名を変更
  def filename
    super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
  end

  # ファイル名は日本語が入ってくると嫌なので、下記のようにしてみてもいい。
  # 日付(20131001.jpgみたいなファイル名)で保存する
  def filename
    "#{Time.zone.now.strftime('%Y%m%d%H%M%S')}.jpg" if original_filename.present?
  end

end