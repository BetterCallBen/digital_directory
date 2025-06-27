# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Supprimer les données existantes pour éviter les doublons
Agency.destroy_all
Tag.destroy_all

# Créer les tags
tags_data = [
  { name: "Sur mesure", description: "Développement de solutions personnalisées" },
  { name: "Application mobile", description: "Développement d'applications iOS et Android" },
  { name: "E-commerce", description: "Création de boutiques en ligne" },
  { name: "UX/UI Design", description: "Conception d'interfaces utilisateur" },
  { name: "Développement web", description: "Création de sites web et applications web" },
  { name: "Stratégie digitale", description: "Conseil en transformation numérique" },
  { name: "SEO/SEA", description: "Référencement naturel et payant" },
  { name: "Maintenance", description: "Support et maintenance d'applications" },
  { name: "Formation", description: "Formation aux outils numériques" },
  { name: "Hébergement", description: "Services d'hébergement web" },
]

tags = []
tags_data.each do |tag_data|
  tag = Tag.create!(tag_data)
  tags << tag
  puts "✓ Tag '#{tag.name}' créé avec succès"
end

# Créer des agences d'exemple
agencies_data = [
  {
    name: "ZOL",
    logo: "/images/logos/zol-logo.jpg",
    creation_date: Date.new(2005, 1, 1),
    annual_turnover: 8_000_000,
    location: "Lyon, Paris",
    team_size: 50,
    website_url: "https://zol.fr",
  },
  {
    name: "GentleView",
    logo: "/images/logos/gentleview-logo.jpg",
    creation_date: Date.new(2018, 3, 15),
    annual_turnover: 2_500_000,
    location: "Lyon, Grenoble",
    team_size: 15,
    website_url: "https://www.gentleview.fr",
  },
  {
    name: "Agence Tiz",
    logo: "https://images.unsplash.com/photo-1622675363311-3e7eb5ad224a?w=150&h=150&fit=crop&crop=center",
    creation_date: Date.new(2009, 6, 1),
    annual_turnover: 3_200_000,
    location: "Lyon",
    team_size: 25,
    website_url: "https://www.agence-tiz.fr",
  },
  {
    name: "Digitas",
    logo: "https://images.unsplash.com/photo-1558655146-d09347e92766?w=150&h=150&fit=crop&crop=center",
    creation_date: Date.new(2001, 3, 20),
    annual_turnover: 15_000_000,
    location: "Lyon, Paris",
    team_size: 120,
    website_url: "https://www.digitas.fr",
  },
  {
    name: "Wanadev",
    logo: "https://images.unsplash.com/photo-1599305445671-ac291c95aaa9?w=150&h=150&fit=crop&crop=center",
    creation_date: Date.new(2014, 9, 10),
    annual_turnover: 4_500_000,
    location: "Lyon",
    team_size: 35,
    website_url: "https://www.wanadev.fr",
  },
  {
    name: "Eskimoz",
    logo: "https://images.unsplash.com/photo-1572044162444-ad60f128bdea?w=150&h=150&fit=crop&crop=center",
    creation_date: Date.new(2011, 2, 14),
    annual_turnover: 2_800_000,
    location: "Lyon, Paris",
    team_size: 18,
    website_url: "https://www.eskimoz.fr",
  },
  {
    name: "Niji",
    logo: "https://images.unsplash.com/photo-1519389950473-47ba0277781c?w=150&h=150&fit=crop&crop=center",
    creation_date: Date.new(2001, 11, 22),
    annual_turnover: 12_000_000,
    location: "Lyon, Nantes, Bordeaux, Rennes",
    team_size: 80,
    website_url: "https://www.niji.fr",
  },
  {
    name: "Linkweb",
    logo: "https://images.unsplash.com/photo-1542744173-8e7e53415bb0?w=150&h=150&fit=crop&crop=center",
    creation_date: Date.new(2000, 3, 15),
    annual_turnover: 1_900_000,
    location: "Lyon",
    team_size: 16,
    website_url: "https://www.linkweb.fr",
  },
  {
    name: "Agence 90",
    logo: "https://images.unsplash.com/photo-1553877522-43269d4ea984?w=150&h=150&fit=crop&crop=center",
    creation_date: Date.new(2012, 1, 10),
    annual_turnover: 1_600_000,
    location: "Lyon",
    team_size: 12,
    website_url: "https://www.agence90.fr",
  },
  {
    name: "Proximis",
    logo: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=center",
    creation_date: Date.new(2004, 7, 20),
    annual_turnover: 5_500_000,
    location: "Lyon, Clermont-Ferrand",
    team_size: 40,
    website_url: "https://www.proximis.com",
  },
  {
    name: "Studio Bagarre",
    logo: "https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=150&h=150&fit=crop&crop=center",
    creation_date: Date.new(2013, 5, 8),
    annual_turnover: 2_200_000,
    location: "Lyon",
    team_size: 20,
    website_url: "https://www.studiobagarre.com",
  },
  {
    name: "Web et Solutions",
    logo: "https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=150&h=150&fit=crop&crop=center",
    creation_date: Date.new(2008, 10, 12),
    annual_turnover: 3_800_000,
    location: "Lyon, Villeurbanne",
    team_size: 28,
    website_url: "https://www.webetsolutions.com",
  },
  {
    name: "Agence Karma",
    logo: "https://images.unsplash.com/photo-1560472354-b33ff0c44a43?w=150&h=150&fit=crop&crop=center",
    creation_date: Date.new(2015, 4, 3),
    annual_turnover: 1_400_000,
    location: "Lyon",
    team_size: 14,
    website_url: "https://www.agence-karma.fr",
  },
  {
    name: "Smile",
    logo: "https://images.unsplash.com/photo-1611224923853-80b023f02d71?w=150&h=150&fit=crop&crop=center",
    creation_date: Date.new(1998, 6, 15),
    annual_turnover: 45_000_000,
    location: "Lyon, Paris, Bordeaux, Nantes, Montpellier",
    team_size: 200,
    website_url: "https://www.smile.eu",
  },
]

agencies_data.each_with_index do |agency_data, index|
  agency = Agency.create!(agency_data)

  # Associer des tags aléatoires à chaque agence
  sample_tags = case index
    when 0 # ZOL
      [tags[0], tags[4], tags[5]] # Sur mesure, Développement web, Stratégie digitale
    when 1 # GentleView
      [tags[3], tags[4], tags[5]] # UX/UI Design, Développement web, Stratégie digitale
    when 2 # Agence Tiz
      [tags[4], tags[5], tags[6]] # Développement web, Stratégie digitale, SEO/SEA
    when 3 # Digitas
      [tags[1], tags[3], tags[5]] # Application mobile, UX/UI Design, Stratégie digitale
    when 4 # Wanadev
      [tags[1], tags[4], tags[8]] # Application mobile, Développement web, Formation
    when 5 # Eskimoz
      [tags[6], tags[5], tags[7]] # SEO/SEA, Stratégie digitale, Maintenance
    when 6 # Niji
      [tags[1], tags[3], tags[4]] # Application mobile, UX/UI Design, Développement web
    when 7 # Linkweb
      [tags[4], tags[6], tags[9]] # Développement web, SEO/SEA, Hébergement
    when 8 # Agence 90
      [tags[3], tags[5], tags[8]] # UX/UI Design, Stratégie digitale, Formation
    when 9 # Proximis
      [tags[0], tags[4], tags[7]] # Sur mesure, Développement web, Maintenance
    when 10 # Studio Bagarre
      [tags[3], tags[4], tags[1]] # UX/UI Design, Développement web, Application mobile
    when 11 # Web et Solutions
      [tags[2], tags[4], tags[7]] # E-commerce, Développement web, Maintenance
    when 12 # Agence Karma
      [tags[3], tags[5], tags[6]] # UX/UI Design, Stratégie digitale, SEO/SEA
    when 13 # Smile
      [tags[0], tags[2], tags[4], tags[9]] # Sur mesure, E-commerce, Développement web, Hébergement
    end

  agency.tags = sample_tags
  puts "✓ Agence '#{agency.name}' créée avec succès avec #{sample_tags.count} tags"
end

puts "\n🎉 #{Agency.count} agences et #{Tag.count} tags ont été créés avec succès!"
puts "Vous pouvez maintenant visiter l'application pour voir l'annuaire."
