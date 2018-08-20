module Mumuki::Laboratory::Controllers::ResultsRendering
  extend ActiveSupport::Concern

  included do
    include ProgressBarHelper, ExerciseInputHelper

    before_action :set_guide_previously_done!
  end

  def render_results_json(assignment, results = {})
    render json: results.merge(
      guide_finished_by_solution: guide_finished_by_solution?,
      class_for_progress_list_item: class_for_progress_list_item(@exercise, true),
      html: render_results_html(assignment),
      title_html: render_results_title_html(assignment),
      button_html: render_results_button_html(assignment),
      expectations_html: render_results_expectations_html(assignment),
      remaining_attempts_html: remaining_attempts_text(assignment.exercise, assignment))
  end

  def render_results_html(assignment)
    render_to_string partial: assignment.results_partial,
                     locals: {assignment: assignment}
  end

  def render_results_title_html(assignment)
    render_to_string partial: 'exercise_solutions/results_title',
                     locals: {contextualization: assignment}
  end

  def render_results_button_html(assignment)
    render_to_string partial: 'exercise_solutions/kids_results_button',
                     locals: {assignment: assignment}
  end

  def render_results_expectations_html(assignment)
    render_to_string partial: 'exercise_solutions/expectations',
                     locals: {assignment: assignment}
  end

  def guide_finished_by_solution?
    !@guide_previously_done && @exercise.guide_done_for?(current_user)
  end

  def set_guide_previously_done!
    @guide_previously_done = @exercise.guide_done_for?(current_user)
  end
end
