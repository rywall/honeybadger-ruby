require 'socket'

module Honeybadger
  class Config
    IGNORE_DEFAULT = ['ActiveRecord::RecordNotFound',
                      'ActionController::RoutingError',
                      'ActionController::InvalidAuthenticityToken',
                      'CGI::Session::CookieStore::TamperedWithCookie',
                      'ActionController::UnknownAction',
                      'AbstractController::ActionNotFound',
                      'Mongoid::Errors::DocumentNotFound',
                      'Sinatra::NotFound'].map(&:freeze).freeze

    OPTIONS = {
      enabled: {
        description: 'Determines if Honeybadger will start.',
        default: true
      },
      debug: {
        description: 'Forces metrics and traces to be reported every 10 seconds rather than 60.',
        default: false
      },
      api_key: {
        description: 'The API key for your Honeybadger project.',
        default: nil
      },
      hostname: {
        description: 'The hostname of the current box.',
        default: Socket.gethostname
      },
      root: {
        description: 'The project\'s absolute root path.',
        default: Dir.pwd
      },
      backend: {
        description: 'An alternate backend to use for reporting data.',
        default: nil
      },
      env: {
        description: 'The current application\'s environment name.',
        default: ENV['HONEYBADGER_ENV']
      },
      public: {
        description: 'Enable reporting of data.',
        default: nil
      },
      environments: {
        description: 'Public environments which are enabled for reporting automatically.',
        default: ['production'.freeze, 'staging'.freeze].freeze
      },
      plugins: {
        description: 'An optional list of plugins to load. Default is to load all plugins.',
        default: nil
      },
      :'plugins.skip' => {
        description: 'An optional list of plugins to skip.',
        default: nil
      },
      :'config.path' => {
        description: 'The path (absolute, or relative from config.root) to the project\'s YAML configuration file.',
        default: ENV['HONEYBADGER_CONFIG_PATH'] || ['honeybadger.yml', 'config/honeybadger.yml']
      },
      :'logging.path' => {
        description: 'The path (absolute, or relative from config.root) to the log file.',
        default: nil
      },
      :'logging.level' => {
        description: 'The log level.',
        default: 'INFO'
      },
      :'connection.secure' => {
        description: 'Use SSL when sending data.',
        default: true
      },
      :'connection.host' => {
        description: 'The host to use when sending data.',
        default: 'api.honeybadger.io'.freeze
      },
      :'connection.port' => {
        description: 'The port to use when sending data.',
        default: nil
      },
      :'connection.system_ssl_cert_chain' => {
        description: 'Use the system\'s SSL certificate chain (if available).',
        default: false
      },
      :'connection.http_open_timeout' => {
        description: 'The HTTP open timeout when connecting to the server.',
        default: 2
      },
      :'connection.http_read_timeout' => {
        description: 'The HTTP read timeout when connecting to the server.',
        default: 5
      },
      :'connection.proxy_host' => {
        description: 'The proxy host to use when sending data.',
        default: nil
      },
      :'connection.proxy_port' => {
        description: 'The proxy port to use when sending data.',
        default: nil
      },
      :'connection.proxy_user' => {
        description: 'The proxy user to use when sending data.',
        default: nil
      },
      :'connection.proxy_pass' => {
        description: 'The proxy password to use when sending data.',
        default: nil
      },
      :'request.filter_keys' => {
        description: 'A list of keys to filter when sending request data.',
        default: ['password'.freeze, 'password_confirmation'.freeze].freeze
      },
      :'request.exclude_keys' => {
        description: 'A list of top-level keys to exclude when sending request data.',
        default: [].freeze
      },
      :'user_informer.enabled' => {
        description: 'Enable the UserInformer middleware.',
        default: true
      },
      :'user_informer.info' => {
        description: 'Replacement string for HTML comment in templates.',
        default: 'Honeybadger Error {{error_id}}'.freeze
      },
      :'feedback.enabled' => {
        description: 'Enable the UserFeedback middleware.',
        default: true
      },
      :'exceptions.enabled' => {
        description: 'Enable automatic reporting of exceptions.',
        default: true
      },
      :'exceptions.ignore' => {
        description: 'A list of exceptions to ignore.',
        default: IGNORE_DEFAULT
      },
      :'exceptions.ignored_user_agents' => {
        description: 'A list of user agents to ignore.',
        default: [].freeze
      },
      :'exceptions.rescue_rake' => {
        description: 'Enable rescuing exceptions in rake tasks.',
        default: true
      },
      :'exceptions.source_radius' => {
        description: 'The number of lines before and after the source when reporting snippets.',
        default: 2
      },
      :'exceptions.local_variables' => {
        description: 'Enable sending local variables. Requires binding_of_caller to be loaded.',
        default: false
      },
      :'metrics.enabled' => {
        description: 'Enable sending metrics.',
        default: true
      },
      :'metrics.gc_profiler' => {
        description: 'Enable sending GC metrics (GC::Profiler must be enabled)',
        default: false
      },
      :'traces.enabled' => {
        description: 'Enable sending traces.',
        default: true
      },
      :'traces.threshold' => {
        description: 'The threshold in seconds to send traces.',
        default: 2000
      }
    }.freeze

    DEFAULTS = Hash[OPTIONS.map{|k,v| [k, v[:default]] }].freeze
  end
end