class NotesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :destroy]
  skip_after_action :verify_authorized, only: [:index, :all, :create, :destroy]

  def index
    @notes = policy_scope(Note).where(user: current_user).sort_by { |n| n.created_at  }.last(3).reverse
    @note = Note.new
    @note.user = current_user
    # authorize @note
  end

  def all
    @notes = policy_scope(Note).where(user: current_user).sort_by { |n| n.created_at  }.reverse
  end

  def create
    @notes = policy_scope(Note).sort_by { |n| n.created_at  }.last(3).reverse
    @note = Note.new(note_params)
    @note.user = current_user
    @note.date = Date.today
    # authorize @note
    respond_to do |format|
      if @note.save
        format.html { redirect_to notes_path }
        format.json # Follow the classic Rails flow and look for a create.json view
      else
        format.html { render "notes/index", status: :unprocessable_entity, notes: @notes }
        format.json # Follow the classic Rails flow and look for a create.json view
      end
    end
  end

  def destroy
    @note = Note.find(params[:id])
    # authorize @note
    @note.destroy
    redirect_to notes_path
  end

  private

  def note_params
    params.require(:note).permit(:text, :date)
  end
end
