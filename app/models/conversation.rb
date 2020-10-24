class Conversation < ApplicationRecord
  #Conversation associe le concept d'utilisateur à l'expéditeur et au destinataire.
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'
  # Une conversation est un à plusieurs avec plusieurs messages.
  has_many :messages, dependent: :destroy
  # Définissez la validation pour éviter que [: sender_id ,: recipient_id] ne soit enregistré dans la même combinaison.
  validates_uniqueness_of :sender_id, scope: :recipient_id

  scope :between, ->(sender_id,recipient_id) do
    where("(conversations.sender_id = ? AND conversations.recipient_id = ?) OR (conversations.sender_id = ? AND conversations.recipient_id = ?)" , sender_id,recipient_id,recipient_id,sender_id)
  end
  
  def target_user(current_user)
    if sender_id == current_user.id
      User.find(recipient_id)
    elsif recipient_id == current_user
      User.find(sender_id)
    end
  end
end
