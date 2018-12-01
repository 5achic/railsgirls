class AddUserRelationships < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :ideas, :user_id, :integer
    add_column :comments, :user_id, :integer

    Comment.all.each do |comment|
      user = User.create(email: comment.id.to_s + '@example.com', password: 'abcdea', name: comment.user_name)
      comment.user_id = user.id
      comment.save!
    end
  end
end
