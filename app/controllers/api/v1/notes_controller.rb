module Api::V1
  class NotesController < ApplicationController
    before_action :set_note, only: [:show, :edit, :update, :destroy]

    # GET /notes
    # GET /notes.json
    def index
      @notes = Note.all
      render json: @notes
    end

    # GET /notes/1
    # GET /notes/1.json
    def show
    end

    # GET /notes/new
    def new
      @note = Note.new
    end

    # GET /notes/1/edit
    def edit
    end

    # POST /notes
    # POST /notes.json
    def create

      # p "note_params.inspect::"
      # p note_params.inspect
      @note = Note.new(note_params)

      if @note.save
        render json: @note
      else
        render json: @note.errors, status: :unprocessable_entity
      end

    end

    # PATCH/PUT /notes/1
    # PATCH/PUT /notes/1.json
    def update
      respond_to do |format|
        if @note.update(note_params)
          format.html { redirect_to @note, notice: 'Note was successfully updated.' }
          format.json { render :show, status: :ok, location: @note }
        else
          format.html { render :edit }
          format.json { render json: @note.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /notes/1
    # DELETE /notes/1.json
    def destroy
      @note.destroy
      respond_to do |format|
        format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_note
        @note = Note.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def note_params
        # Note that newsted attributes have to have _attributes suffix in Rails
        params[:note][:images_attributes] ||= []
        params.require(:note).permit(:title, :description, :lat, :long, images_attributes:[ :url, :base64 ])
      end
  end
end
