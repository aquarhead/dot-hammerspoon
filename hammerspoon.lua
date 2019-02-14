itunesTitle = hs.menubar.new()

function setItunesTitle()
  if hs.itunes.isRunning() then
    title = string.gsub(hs.itunes.getCurrentTrack(), "%(Live at .*%)", "")
    album = hs.itunes.getCurrentAlbum()
    artist = hs.itunes.getCurrentArtist()
    if title and hs.itunes.getPlaybackState() ~= hs.itunes.state_stopped then
      itunesTitle:setTitle(title .. ' - ' .. artist .. ' | ' .. album)
    else
      itunesTitle:setTitle('-')
    end
  else
    itunesTitle:setTitle('> iTunes')
  end
end

function openItunes()
  hs.application.launchOrFocusByBundleID("com.apple.iTunes")
end
itunesTitle:setClickCallback(openItunes)

setItunesTitle()
always = hs.timer.doEvery(3, setItunesTitle)
