# frozen_string_literal: true

require_relative 'checks'
require 'set'

module Checks
  # This is a Jekyll Generator
  class CheckUserInfo < Jekyll::Generator
    # Main entry point for Jekyll
    def generate(site)
      @site = site

      people_in_inst = Set.new
      @site.collections['institutes'].docs.each do |inst_hash|
        print "University #{inst_hash.data['title']} \n"
        print "University personnel #{inst_hash.data['personnel']} \n"
        print "What? #{inst_hash.data['personnel'].class} \n"
        people_in_inst.merge(inst_hash.data['personnel']) unless inst_hash.data['personnel'].nil?
      end

      @site.collections['collaborators'].docs.each do |myperson|
        # The following is not correct, it should I think be
        # the actual filename (to compare with shortname below)
        # This kind-of disables the check.
        name = myperson.data['shortname']
        print "checkusers: working on #{name} \n"
        # msg = "_data/people/#{name}.yml"
        msg = myperson.url.to_s
        print msg
        person = Record.new(msg, myperson.data)

        person.key 'name', :nonempty
        person.key 'shortname', match: name
        person.key 'title'
        person.key 'institution', :nonempty
        person.key 'photo', :optional
        person.key 'focus-area', :optional

        person.print_warnings

        if myperson.data['hidden']
          msg = 'is listed in a institute and hidden is True'
          person.raise_err msg if people_in_inst.include? myperson.data['shortname']
        else
          msg = 'is not listed in a institute and hidden is not True'
          person.raise_err msg unless people_in_inst.include? myperson.data['shortname']
        end
      end
    end
  end
end
