class AddAttachmentFotoToEstudiantes < ActiveRecord::Migration
  def self.up
    change_table :estudiantes do |t|
      t.attachment :foto
    end
  end

  def self.down
    drop_attached_file :estudiantes, :foto
  end
end
