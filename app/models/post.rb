class Post < ApplicationRecord

    # 入力必須項目
    with_options presence: true do
        validates :title
        validates :start_date
        validates :end_date
    end

    # タイトル20文字、メモの長さ500文字を上限に設定
    validates :title,{length: {maximum: 20}}
    validates :memo,{length: {maximum: 500}}

    #バリデーションを定義 開始日より前の日付を登録できないように
    validate :start_end_check
    def start_end_check
        if start_date.present? && end_date.present? && start_date > end_date
        errors.add(:end_date, "は開始日より前の日付は登録できません。")
        end
    end

end
