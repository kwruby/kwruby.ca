require 'scss_lint/rake_task'
require 'rubocop/rake_task'
require 'rspec/core/rake_task'
require 'fileutils'

def tmpdir(*args)
  File.join(Rake.application.original_dir, 'tmp', *args.flatten)
end

RuboCop::RakeTask.new do |task|
  report_filename = tmpdir('rubocop.txt')
  FileUtils.mkdir_p(File.dirname(report_filename))
  task.options =
    %w(--format progress --format simple --out) + [report_filename]
end

RSpec::Core::RakeTask.new

SCSSLint::RakeTask.new do |task|
  task.files = Dir.glob('source/**/*.scss')

  # TODO: Investigate how to output to STDOUT and filename
  #  report_filename = tmpdir('scss_lint.txt')
  #  FileUtils.mkdir_p(File.dirname(report_filename))
  # task.args = ['--out', report_filename]
end

task default: [:spec, :rubocop, :scss_lint]
