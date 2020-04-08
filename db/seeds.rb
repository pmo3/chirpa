# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
chirps = [
  {
    text:        "Hey take those earcuffs off ya fuckin' nerd!",
    attribution: "Travis Konecny",
    approved:    true
  },
  {
    text:        "You're the fucking best Bellows. You're a fucking superstar",
    attribution: "Kevin Stevens",
    approved:    true
  }, {
    text:        "I'm fifth in the league at faceoffs, look at NHL.com. You're a good player, you're doing well. I'm fifth in the league so I'm probably going to win it right there",
    attribution: "Steve Ott, to Claude Giroux",
    approved:    true
  }, {
    text:        "Get you and your turtleneck out of here. I can't believe you still wear those",
    attribution: "Shawn Thornton",
    approved:    true
  }, {
    text:        "Suck it Phaneuf. Woo!",
    attribution: "Scott Hartnell, at the ASG",
    approved:    true
  }, {
    text:        "Forget it, cake-eater. If you wanna play, play with yourself",
    attribution: "Jesse Hall",
    approved:    true
  }, {
    text:        "One day in the NHL for you. Fantasy camp for you",
    attribution: "Brad Richards, New York Rangers",
    approved:    true
  }, {
    text:        "You can't handle me, Georges",
    attribution: "Sean Avery",
    approved:    true
  }, {
    text:        "Tell me when, big shooter",
    attribution: "Sean Avery",
    approved:    true
  }, {
    text:        "I'll be right there all night you fuckin slug",
    attribution: "Sean Avery",
    approved:    true
  }, {
    text:        "Hey turn around. Who the fuck are you? Enjoy your five games kid, you'll be back in the minors before you fuckin know it",
    attribution: "Shawn Thornton",
    approved:    true
  }, {
    text:        "Suck it, eyebrows",
    attribution: "Shawn Thornton",
    approved:    true
  }, {
    text:        "Have another donut!",
    attribution: "Jim Schoenfeld, to referre Don Koharski",
    approved:    true
  }, {
    text:        "What are you gonna do about it? Oh you're a good power play scorer now huh? Holy fuck",
    attribution: "Scott Hartnell",
    approved:    true
  }, {
    text:        "What, did I hit you in the hit? ... I didn't mean to, I thought you were Marchand",
    attribution: "PK Subban",
    approved:    true
  }, {
    text:        "What are you doing? You're a fucking bonehead",
    attribution: "Travis Konecny",
    approved:    true
  }, {
    text:        "Can't stay up on your feet? What happened there? Tripped over the fuckin line?...Oh come on, you're a big boy, you should be able to stand up",
    attribution: "Martin Biron",
    approved:    true
  }, {
    text:        "Good penalty, bud.",
    attribution: "Jarome Iginla",
    approved:    true
  }, {
    text:        "I can't really hear what [you say], because I've got my two Stanley Cup rings plugging my ears",
    attribution: "Patrick Roy, to Jeremy Roenick",
    approved:    true
  }, {
    text:        "You fucking pigeon! Brrrrrrr",
    attribution: "Claude Giroux, to JVR",
    approved:    true
  }, {
    text:        "Suck it, you milk drinker",
    attribution: "Shawn Thornton",
    approved:    true
  }, {
    text:        "I don't think you can have a handlebar mustache if you're four foot two",
    attribution: "Shawn Thornton",
    approved:    true
  }, {
    text:        "You're fucking irrelevant out here",
    attribution: "Mike Rupp",
    approved:    true
  }, {
    text:        "You're not scary",
    attribution: "Ryan Getzlaf",
    approved:    true
  }, {
    text:        "Did you drink a pepsi today?",
    attribution: "Claude Giroux",
    approved:    true
  }, {
    text:        "You can pick the hand I beat the fuck out of you with",
    attribution: "Shawn Thornton",
    approved:    true
  }, {
    text:        "Buddy you suck at hockey. You've been in the minors how long? How long? And you're still on the fourth line",
    attribution: "Drew Doughty",
    approved:    true
  }, {
    text:        "Brooksie if I wanted to explan it to you I would",
    attribution: "John Tortorella",
    approved:    true
  }, {
    text:        "You were probably beat up in the bus stop most of the time",
    attribution: "John Tortorella, to Larry Brooks",
    approved:    true
  }, {
    text:        "Where'd they find the aquarium to fit your head?",
    attribution: "Not sure",
    approved:    true
  }, {
    text:        "Atta boy Horny, serve that one you useless fuck",
    attribution: "Travis Konecny",
    approved:    true
  }, {
    text:        "Eat up, bud!",
    attribution: "Travis Konecny",
    approved:    true
  }
]

chirps.each do |chirp|
  Chirp.where(chirp).first_or_create
end
