class Agency < ApplicationRecord
  has_many :agency_tags, dependent: :destroy
  has_many :tags, through: :agency_tags

  validates :name, presence: true, length: { maximum: 255 }
  validates :creation_date, presence: true
  validates :annual_turnover, presence: true, numericality: { greater_than: 0 }
  validates :location, presence: true
  validates :team_size, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :website_url, length: { maximum: 500 }, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "doit être une URL valide" }, allow_blank: true

  # Méthode pour formater le chiffre d'affaires
  def formatted_annual_turnover
    return "N/A" unless annual_turnover.present?

    if annual_turnover >= 1_000_000
      "#{(annual_turnover / 1_000_000.0).round(1)}M€"
    elsif annual_turnover >= 1_000
      "#{(annual_turnover / 1_000.0).round(0)}K€"
    else
      "#{annual_turnover.to_i}€"
    end
  end

  # Méthode pour afficher une version courte de la localisation
  def short_location
    location.split(",").first.strip if location.present?
  end

  # Méthode pour calculer l'âge de l'agence
  def age_in_years
    return 0 unless creation_date.present?

    ((Date.current - creation_date) / 365.25).floor
  end

  # Méthode pour générer des couleurs uniques basées sur le nom de l'agence
  def brand_colors
    # Couleurs spécifiques pour chaque agence connue
    case name.downcase
    when "zol"
      # Couleurs officielles ZOL : violet #8837E6 et bleu #4682E6
      {
        primary: "from-[#8837E6] to-[#4682E6]",
        secondary: "from-[#4682E6] to-[#8837E6]",
        accent: "from-[#9d4ded] to-[#5c92ed]",
      }
    when "gentleview"
      # Couleur officielle GentleView : bronze/orange #AD6127
      {
        primary: "from-[#AD6127] to-[#8B4513]",
        secondary: "from-[#D2691E] to-[#AD6127]",
        accent: "from-[#CD853F] to-[#A0522D]",
      }
    when "agence tiz"
      { primary: "from-blue-500 to-indigo-600", secondary: "from-indigo-400 to-blue-500", accent: "from-sky-500 to-blue-600" }
    when "digitas"
      { primary: "from-purple-500 to-violet-600", secondary: "from-violet-400 to-purple-500", accent: "from-fuchsia-500 to-purple-600" }
    when "wanadev"
      { primary: "from-amber-500 to-orange-600", secondary: "from-orange-400 to-amber-500", accent: "from-yellow-500 to-orange-600" }
    when "eskimoz"
      { primary: "from-cyan-500 to-blue-600", secondary: "from-blue-400 to-cyan-500", accent: "from-sky-500 to-cyan-600" }
    when "niji"
      { primary: "from-rose-500 to-pink-600", secondary: "from-pink-400 to-rose-500", accent: "from-red-500 to-pink-600" }
    when "linkweb"
      { primary: "from-lime-500 to-green-600", secondary: "from-green-400 to-lime-500", accent: "from-emerald-500 to-green-600" }
    when "agence 90"
      { primary: "from-slate-500 to-gray-600", secondary: "from-gray-400 to-slate-500", accent: "from-zinc-500 to-gray-600" }
    when "proximis"
      { primary: "from-indigo-500 to-purple-600", secondary: "from-purple-400 to-indigo-500", accent: "from-violet-500 to-purple-600" }
    when "studio bagarre"
      { primary: "from-orange-500 to-red-600", secondary: "from-red-400 to-orange-500", accent: "from-pink-500 to-orange-600" }
    when "web et solutions"
      { primary: "from-teal-500 to-cyan-600", secondary: "from-cyan-400 to-teal-500", accent: "from-blue-500 to-teal-600" }
    when "agence karma"
      { primary: "from-violet-500 to-purple-600", secondary: "from-purple-400 to-violet-500", accent: "from-indigo-500 to-violet-600" }
    when "smile"
      { primary: "from-green-500 to-emerald-600", secondary: "from-emerald-400 to-green-500", accent: "from-teal-500 to-green-600" }
    else
      # Couleurs par défaut pour les nouvelles agences
      hash = name.bytes.sum
      palettes = [
        { primary: "from-blue-500 to-indigo-600", secondary: "from-indigo-400 to-blue-500", accent: "from-sky-500 to-blue-600" },
        { primary: "from-emerald-500 to-teal-600", secondary: "from-teal-400 to-emerald-500", accent: "from-green-500 to-teal-600" },
        { primary: "from-purple-500 to-violet-600", secondary: "from-violet-400 to-purple-500", accent: "from-fuchsia-500 to-purple-600" },
        { primary: "from-orange-500 to-red-600", secondary: "from-red-400 to-orange-500", accent: "from-pink-500 to-orange-600" },
      ]
      palettes[hash % palettes.length]
    end
  end
end
