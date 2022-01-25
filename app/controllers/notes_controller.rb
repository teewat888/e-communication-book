class NotesController < ApplicationController
    before_action :note_params, only: [:create, :update]
    before_action :set_note, only: [:show, :destroy]

    def index
        @notes = Note.all
    end
    
    def new
        @note = Note.new
    end
    
    def create 
        @note = Note.new(note_params)
        @note.save
        redirect_to notes_path

    end

    def show
    end

    def destroy
        @note.destroy
        redirect_to notes_path
    end

    private

    def note_params
        params.require(:note).permit(:title, :content)
    end

    def set_note
        @note = Note.find(params[:id])
    end
end