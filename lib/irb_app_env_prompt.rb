require "irb_app_env_prompt/version"

class IRBAppEnvPrompt
  def self.configure(app, env)
    return unless defined? IRB

    new.call(app, env)
  end

  def call(app, env)
    ansi_red = 31
    ansi_green = 32
    ansi_yellow = 33

    env_description = {
      "development" => "dev",
      "staging" => "stag",
      "production" => "prod",
    }.fetch(env) { "unknown" }

    env_color = {
      "dev" => ansi_green,
      "stag" => ansi_yellow,
      "prod" => ansi_red,
    }.fetch(env_description) { ansi_red }

    env_prompt = "#{app}(#{paint(env_color, env_description)})"

    IRB.conf[:PROMPT][prompt_sym] = {
      PROMPT_I: "#{env_prompt}> ",
      PROMPT_N: "#{env_prompt}> ",
      PROMPT_S: "#{env_prompt}%l ",
      PROMPT_C: "#{env_prompt}* ",
      RETURN: "=> %s\n",
    }
    IRB.conf[:PROMPT_MODE] = prompt_sym
  end

  private

  def paint(color, text)
    "\033[#{color}m#{text}\033[0m"
  end

  def prompt_sym
    :APP_ENV
  end
end
