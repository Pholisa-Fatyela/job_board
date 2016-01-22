class JobsDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Job.count,
      iTotalDisplayRecords: jobs.total_entries,
      aaData: data
    }
  end

private

  def data
    jobs.map do |job|
      [
        link_to(job.name, job),
        h(job.category),
        h(job.released_on.strftime("%B %e, %Y")),
        number_to_currency(job.price)
      ]
    end
  end

  def jobs
    @jobs ||= fetch_products
  end

  def fetch_products
    jobs = Job.order("#{sort_column} #{sort_direction}")
    jobs = jobs.page(page).per_page(per_page)
    if params[:sSearch].present?
      jobs = jobs.where("name like :search or category like :search", search: "%#{params[:sSearch]}%")
    end
    jobs
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name category released_on price]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end