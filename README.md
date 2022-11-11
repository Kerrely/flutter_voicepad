# Voice Pad

Let's bring some fun when the right moment comes!

Roadmap: https://trello.com/b/jUPexYk7/voice-pad

Contributions are welcome!

# Wanna add your own voice lines?

The app does not support adding voicelines directly via UI... __YET__! But if you wish, you can easily pull the repo and follow those easy steps:

  1. Create a new folder named by the source game or movie (the voice lines are coming from) under the `assets` directory. The name should be exactly the same as the original game/movie. Example:
  ```
  root/assets/voices/Pirates of the Caribbean
  ```
  
  2. Add any voice lines you have recorded/created into this folder. Naming of the files should either copy the sentence of the recording or describe as much as possible what is being said in the voice line. The final structure should look like the following:
  ```
  root/assets/voices/Pirates of the Caribbean/Remember the day you have nearly captured captain Jack Sparrow.mp3
  ```
  
  That's it! The app will do the rest now. If you wish to share your creation with others, feel free to create a `Pull request` with added files. You can now either build the app yourself or wait until the merged changes will be available in the new release.

Inadequate recordings (like targeted harm or harassment) may be rejected!

## Languages
The app currently does not support language change (is planned). The voice lines should be in the Czech language only right now. But if you wish you can add the files for yourself there and optionally try to create a pull request. It might bring some changes :wink:.
  
## Supported formats
 - mp3
 - mp4
 - wav
 
## Tips
 - Do use optimalized formats to help to save some space.
 - Do keep the recordings short and cut exactly at the beginning and at the end of desired voice line.
 - The app automatically resizes the name of the voice line to fit into the cards - the longer, the smaller the text will be.
