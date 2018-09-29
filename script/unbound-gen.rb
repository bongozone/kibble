#!/usr/bin/env ruby
# quick and dirty dns record generation

first = ARGV[0].to_i
last = ARGV[1].to_i
file = ARGV[2] || '/dev/null'
zone_prefox = ARGV[3] || "mesh"
zone_net = ARGV[4] || "net"
zone_bc = ARGV[5] || "all"
ip_prefix = "10.70.145."
zone_suffix = ".bongo.zone"

lines = (File.read file).split "\n"

puts "## #{$0} #{ARGV.join ' '}\n"

octets = (first..last)
octets.each do |octet|
    ip = "#{ip_prefix}#{octet}"
    com = ""
    com = "#" unless lines.grep(/^[^#].*#{ip}"/).empty?

    printed = octet
    printed = zone_net if octet == octets.first
    printed = zone_bc if octet == octets.last
    printed = "#{ip_prefix.gsub /\./,'-'}#{printed}"
    host = "#{zone_prefox}-#{printed}#{zone_suffix}"
    puts %{
        #{com}local-data: "#{host} 300 IN A #{ip}"
        #{com}local-data-ptr: "#{ip} #{host}"
}.chomp.sub(/^\s*/, '').gsub(/\n\s*/,"\n")
    end