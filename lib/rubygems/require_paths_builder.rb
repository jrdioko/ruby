######################################################################
# This file is imported from the rubygems project.
# DO NOT make modifications in this repo. They _will_ be reverted!
# File a patch instead and assign it to Ryan Davis or Eric Hodel.
######################################################################

require 'rubygems'

# TODO: remove after 1.9.1 dropped
module Gem::RequirePathsBuilder
  def write_require_paths_file_if_needed(spec = @spec, gem_home = @gem_home)
    return if spec.require_paths == ["lib"] &&
              (spec.bindir.nil? || spec.bindir == "bin")
    file_name = File.join(gem_home, 'gems', "#{@spec.full_name}", ".require_paths")
    file_name.untaint
    File.open(file_name, "w") do |file|
      spec.require_paths.each do |path|
        file.puts path
      end
      file.puts spec.bindir if spec.bindir
    end
  end
end if QUICKLOADER_SUCKAGE

