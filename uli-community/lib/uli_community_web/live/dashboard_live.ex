defmodule UliCommunityWeb.DashboardLive do
  use UliCommunityWeb, :live_view

  alias UliCommunity.UserContribution

  def mount(_params, _session, socket) do
    slurs =
      try do
        UserContribution.get_top_slurs(10)
      rescue
        _ -> nil
      end

    severity_data =
      try do
        UserContribution.get_severity_distribution()
      rescue
        _ -> nil
      end

    source_data =
      try do
        UserContribution.get_source_distribution()
      rescue
        _ -> nil
      end

    weekly_submissions_data =
      try do
        UserContribution.get_weekly_submission_counts()
      rescue
        _ -> nil
      end

    unique_slur_count =
      try do
        UserContribution.get_unique_slur_count()
      rescue
        _ -> nil
      end

    {:ok,
     assign(socket,
       slurs: slurs,
       severity_data: severity_data,
       source_data: source_data,
       weekly_submissions_data: weekly_submissions_data,
       unique_slur_count: unique_slur_count
     )}
  end
end
