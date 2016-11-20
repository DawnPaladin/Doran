# [Doran](http://champion-select-assistant.herokuapp.com/)
An assistant for League of Legends Champion Select.

![snapshot preview](http://champion-select-assistant.herokuapp.com/readme-snapshot.png)

Keep this open during Champion Select. Add friendly and enemy champs as they're selected by each team, and it will suggest counterpicks and give you an overview of your team's strengths and weaknesses.

This project is still in a very early stage; it wants a few more features, and the data it provides is very limited. If you like, you're welcome to contribute data by editing [the data file](https://github.com/DawnPaladin/Doran/blob/master/champ_data.json) and submitting a pull request. (Hopefully at some point I will learn how to set up a form to make submitting data more convenient!)

Planned features:

- [ ] Prevent users from adding duplicate champions
- [ ] Give strengths and weaknesses their own boxes instead of mixing them together
- [ ] When a champion is countered, stop offering counters for that champ

Planned optimizations:

- [ ] Create a view template for champion rows
- [ ] Automatically generate the list of selectable champions from the datafile instead of needing to do it manually
- [ ] Fix tabbing between input boxes
- [ ] Prevent adding more than 5 champs to a team

Someday it would be great to get play rates, counters, and bans from [Champion.GG](http://champion.gg) or grab them from Riot's API the way that site does. Who knows what the future holds? ¯\\\_(ツ)_/¯
