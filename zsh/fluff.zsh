#Load prompt
autoload -U promptinit; promptinit; prompt suse

# Show correct name on each system
case $( hostname ) in
    Sol.local) figlet 'Sol'
               echo 'Welcome home,' $USER
               ;;
    Vega)      figlet 'Vega'
               echo 'Greetings Navigator' $USER
               ;;
    Sirius)    figlet 'Sirius'
               echo 'Enjoy the surroundings'
               ;;
    Naos)      figlet 'Naos'
               echo 'Greetings '$USER', this vessel is at your command'
               ;;
    Rigel)     figlet 'Rigel'
               echo $USER'? Its odd to see you this far out...'
               ;;
    Fornax)    figlet 'Fornax'
               echo 'Hello '$USER', what services do you require today?'
               ;;
    Centarus)  figlet 'Centarus'
               echo 'Enjoy your stay at our data archive '$USER', we have many interesting files'
               ;;
    Deneb)     figlet 'Deneb'
               echo 'Hey '$USER'!'
               ;;
    *)         figlet 'System Unknown'
               echo '[[Error]] {{No system data}} <<Nav marker dropped, awaiting response>>'
               ;;
esac
