
class HtmlRenderer
  # Prints out the template, substituing '$1' with args[0],
  # '$2' with args[1], and so on.  If the template string
  # is tainted an exception should be raised.  (The equivalent
  # of 'throw' in Java/JavaScript is 'raise' in Ruby).
  def render(template, *args)
    html = template.dup
    args.each_with_index do |val, i|
        template.gsub!('i','$' << i)
    end
    if(template.tainted?)
        raise "error"
    end
    puts html
  end

  # Replace special characters with their HTML entities:
  # '<' should be '&lt;',
  # '>' should be '&gt;', and
  # '&' should become '&amp;'.
  def encode(s)
      s.gsub!("<","&lt;")
      s.gsub!(">","&gt;")
      s.gsub!("& ","&amp;")
    s
  end
end


hr = HtmlRenderer.new

puts "<!--"
s = hr.encode("a < b")
puts s

s2 = "Monads & Haskell's bind operator (>>=) explained"
puts hr.encode(s2)

# First, we will render a bad template that has an XSS vulnerability.
# XSS flaws are one of the most ubiquitous vulnerabilities today.
begin
  # Simulated data read from an untrusted source.
  untrusted = %{
    --><script>
      alert('Ha!  I hack you!');
    </script><!--
  }.taint
  bad_template = "<p>Maybe a user has the option to type in their name and have it show up here: " + untrusted + ".</p>"
  hr.render(bad_template)
rescue
  puts "<strong>Caught exception</strong>"
end


# Simple render example, used correctly
good_template = %{
  <strong>$1</strong>
}
hr.render(good_template, "Success")
puts "-->"

template = %{
  <html>
  <head>
    <title>$1</title>
  </head>
  <body>
    <h1>$1</h1>
    <p>
    Monads are one of the most confusing features to Haskell programmers.
    The explanations are often enticing and mysterious;
    You may hear them referred to as "programmable semicolons".
    </p>
    <img src='$2' />
    <img src='$3' />
    <p>
    They are an interesting design pattern.
    For a good explanation, you can read <a href='$4'>$5</a>.
    (Or, if you come back to SJSU for grad school, take CS 252 with me).
    </p>
    <p>
    </p>
  </body>
  </html>
}

# If your library is working correctly, "Learn You a Haskell" should
# **not** be in italics.
hr.render(template,
          s2,
          'https://miro.medium.com/max/1276/0*WXYsA_WrYTAaQMRH',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQGzuWGvxSE765ShzCZGO5ek6tPot6CgT6NcRAMrmysyboBCT60',
          'http://learnyouahaskell.com/a-fistful-of-monads',
          '<em>Learn You a Haskell for Great Good!</em>')


