#Load prompt
autoload -U promptinit; promptinit; prompt suse

# Show correct name on each system
case $( hostname ) in
    Sol|sol.drisc.io)           figlet 'Sol'
                                echo 'Welcome home,' $USER
                                ;;
    Vega|vega.drisc.io)         figlet 'Vega'
                                echo 'Greetings Navigator' $USER
                                ;;
    Sirius|sirius.drisc.io)     figlet 'Sirius'
                                echo 'Enjoy the surroundings'
                                ;;
    Naos|naos.drisc.io)         figlet 'Naos'
                                echo 'Greetings '$USER', welcome to the gate network hub'
                                ;;
    Sargas|sargas.drisc.io)     figlet 'Sargas'
                                echo 'drisc'\''s cyberdeck'
                                ;;
    Rigel)                      figlet 'Rigel'
                                echo $USER'? Its odd to see you this far out...'
                                ;;
    Antares|antares.drisc.io)    figlet 'Antares'
                                echo 'Hello '$USER', what services do you require today?'
                                ;;
    Centarus|centarus.drisc.io) figlet 'Centarus'
                                echo 'Enjoy your stay at our data archive '$USER', we have many interesting files'
                                ;;
    Deneb|deneb.drisc.io)       figlet 'Deneb'
                                echo 'Going on an adventure '$USER'?'
                                ;;
    *)                          figlet 'System Unknown'
                                echo '[[Error]] {{No system data}} <<Nav marker dropped, awaiting response>>'
                                ;;
esac
