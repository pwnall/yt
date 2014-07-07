The goal of YT is to support all the methods available through YouTube APIs.

Check below to see if a method is available. If it’s not, feel free to contribute!

Activities
----------

- [ ] Activity resource ([docs](https://developers.google.com/youtube/v3/docs/activities))
  - [ ] kind
  - [ ] etag
  - [ ] id
  - [ ] snippet (title, description, publishedAt, thumbnails, channelTitle, type, groupId)
  - [ ] contentDetails (upload, like, favorite, comment, subscription, playlistItem, recommendation, bulletin, social, channelItem)
- [ ] List activities ([docs](https://developers.google.com/youtube/v3/docs/activities/list))
  - [ ] part (contentDetails, id, snippet)
  - [ ] channelId
  - [ ] home
  - [ ] mine
  - [ ] maxResults
  - [ ] pageToken
  - [ ] publishedAfter
  - [ ] publishedBefore
  - [ ] regionCode
- [ ] Insert activity ([docs](https://developers.google.com/youtube/v3/docs/activities/insert))
  - [ ] part#contentDetails (bulletin)
  - [ ] part#snippet (description)

ChannelBanners
--------------

- [ ] Channel banner resource ([docs](https://developers.google.com/youtube/v3/docs/channelBanners))
  - [ ] kind
  - [ ] etag
  - [ ] url
- [ ] Insert channel banner ([docs](https://developers.google.com/youtube/v3/docs/channelBanners/insert))
  - [ ] param: onBehalfOfContentOwner

Channels
--------

- [x] Channel resource ([docs](https://developers.google.com/youtube/v3/docs/channels))
  - [x] kind
  - [ ] etag
  - [x] id
  - [x] snippet (title, description, publishedAt, thumbnails)
  - [ ] contentDetails (relatedPlaylists, googlePlusUserId)
  - [x] statistics (viewcount, commentCount, subscriberCount, hiddenSubscriberCount, videoCount)
  - [ ] topicDetails (topicIds)
  - [ ] status (privacyStatus, isLinked)
  - [ ] brandingSettings (channel, watch, image, hints)
  - [ ] invideoPromotion (defaultTiming, position, items)
  - [ ] auditDetails (overallGoodStanding, communityGuidelinesGoodStanding, copyrightStrikesGoodStanding, contentIdClaimsGoodStanding)
  - [ ] contentOwnerDetails (contentOwner, timeLinked)
- [x] List channels ([docs](https://developers.google.com/youtube/v3/docs/channels/list))
  - [ ] part (auditDetails, brandingSettings, contentDetails, id, invideoPromotion, snippet, statistics, status, topicDetails)
  - [ ] categoryId
  - [x] forUsername
  - [x] id
  - [x] managedByMe
  - [x] mine
  - [x] maxResults
  - [x] onBehalfOfContentOwner
  - [x] pageToken
- [ ] Update (channel [docs](https://developers.google.com/youtube/v3/docs/channels/update))
  - [ ] part#brandingSettings (channel, image)
  - [ ] part#invideoPromotion (position, defaultTiming, items)
  - [ ] onBehalfOfContentOwner

ChannelSections
---------------

- [ ] Channel section resource ([docs](https://developers.google.com/youtube/v3/docs/channelSections))
  - [ ] kind
  - [ ] etag
  - [ ] id
  - [ ] snippet (type, style, channelId, title, position)
  - [ ] contentDetails (playlists, channels)
- [ ] List channel sections ([docs](https://developers.google.com/youtube/v3/docs/channelSections/list))
  - [ ] part (contentDetails, id, snippet)
  - [ ] channelId
  - [ ] id
  - [ ] mine
  - [ ] onBehalfOfContentOwner
- [ ] Insert channel section ([docs](https://developers.google.com/youtube/v3/docs/channelSections/insert))
  - [ ] part#snippet (type, style, title, position)
  - [ ] part#contentDetails (playlists, channels)
  - [ ] onBehalfOfContentOwner
  - [ ] onBehalfOfContentOwnerChannel
- [ ] Update channel section ([docs](https://developers.google.com/youtube/v3/docs/channelSections/update))
  - [ ] part#snippet (type, style, title, position)
  - [ ] part#contentDetails (playlists, channels)
- [ ] Delete channel section ([docs](https://developers.google.com/youtube/v3/docs/channelSections/delete))
  - [ ] id

GuideCategories
---------------

- [ ] GuideCategory resource ([docs](https://developers.google.com/youtube/v3/docs/guideCategories))
  - [ ] kind
  - [ ] etag
  - [ ] id
  - [ ] snippet (type, style, channelId, title, position)
- [ ] List guide categories ([docs](https://developers.google.com/youtube/v3/docs/guideCategories/list))
  - [ ] part (snippet)
  - [ ] id
  - [ ] regionCode
  - [ ] hl

I18nLanguages
-------------

- [ ] I18nLanguage resource ([docs](https://developers.google.com/youtube/v3/docs/i18nLanguages))
  - [ ] kind
  - [ ] etag
  - [ ] id
  - [ ] snippet (hl, name)
- [ ] List I18N languages ([docs](https://developers.google.com/youtube/v3/docs/i18nLanguages/list))
  - [ ] part (snippet)
  - [ ] hl

I18nRegions
-----------

- [ ] I18nRegion resource ([docs](https://developers.google.com/youtube/v3/docs/i18nRegions))
  - [ ] kind
  - [ ] etag
  - [ ] id
  - [ ] snippet (gl, name)
- [ ] List I18N regions ([docs](https://developers.google.com/youtube/v3/docs/i18nRegions/list))
  - [ ] part (snippet)
  - [ ] hl

PlaylistItems
-------------

- [x] PlaylistItem resource ([docs](https://developers.google.com/youtube/v3/docs/playlistItems))
  - [x] kind
  - [ ] etag
  - [x] id
  - [x] snippet (publishedAt, channelId, title, description, thumbnails, channelTitle, playlistId, position, resourceId)
  - [ ] contentDetails (videoId, startAt, endAt, note)
  - [x] status (privacyStatus)
- [x] List playlist items ([docs](https://developers.google.com/youtube/v3/docs/playlistItems/list))
  - [ ] part (contentDetails, id, snippet, status)
  - [ ] id
  - [x] playlistId
  - [x] maxResults
  - [ ] onBehalfOfContentOwner
  - [x] pageToken
  - [ ] videoId
- [x] Insert playlist item ([docs](https://developers.google.com/youtube/v3/docs/playlistItems/insert))
  - [x] part#snippet (playlistId, resourceId, position)
  - [ ] part#contentDetails (note, startAt, endAt)
  - [ ] onBehalfOfContentOwner
- [ ] Update playlist item ([docs](https://developers.google.com/youtube/v3/docs/playlistItems/update))
  - [ ] part#snippet (playlistId, resourceId, position)
  - [ ] part#contentDetails (note, startAt, endAt)
- [x] Delete playlist item ([docs](https://developers.google.com/youtube/v3/docs/playlistItems/delete))

Playlists
---------

- [x] Playlist resource ([docs](https://developers.google.com/youtube/v3/docs/playlists))
  - [x] kind
  - [ ] etag
  - [x] id
  - [x] snippet (publishedAt, channelId, title, description, thumbnails, channelTitle, tags)
  - [x] status (privacyStatus)
  - [ ] contentDetails (itemCount)
  - [ ] player (embedHtml)
- [x] List playlists ([docs](https://developers.google.com/youtube/v3/docs/playlists/list))
  - [ ] part (contentDetails, id, player, snippet, status)
  - [x] channelId
  - [ ] id
  - [x] mine
  - [x] maxResults
  - [ ] onBehalfOfContentOwner
  - [ ] onBehalfOfContentOwnerChannel
  - [x] pageToken
- [x] Insert a playlist ([docs](https://developers.google.com/youtube/v3/docs/playlists/insert))
  - [x] part#snippet (title, description, tags)
  - [x] part#status (privacyStatus)
  - [ ] onBehalfOfContentOwner
  - [ ] onBehalfOfContentOwnerChannel
- [x] Update a playlist ([docs](https://developers.google.com/youtube/v3/docs/playlists/update))
  - [x] part#snippet (title, description, tags)
  - [x] part#status (privacyStatus)
  - [ ] onBehalfOfContentOwner
- [x] Delete a playlist ([docs](https://developers.google.com/youtube/v3/docs/playlists/delete))
  - [ ] onBehalfOfContentOwner

Search
------

- [x] Search result resource ([docs](https://developers.google.com/youtube/v3/docs/search))
  - [x] kind
  - [ ] etag
  - [ ] id (kind, videoId, channelId, playlistId)
  - [x] snippet (publishedAt, channelId, title, description, thumbnails, channelTitle, liveBroadcastContent)
- [x] List search results ([docs](https://developers.google.com/youtube/v3/docs/search/list))
  - [ ] part (snippet)
  - [ ] forContentOwner
  - [x] forMine
  - [ ] relatedToVideoId
  - [x] channelId
  - [ ] channelType
  - [ ] eventType
  - [ ] location
  - [ ] locationRadius
  - [x] maxResults
  - [ ] onBehalfOfContentOwner
  - [ ] order
  - [ ] pageToken
  - [ ] publishedAfter
  - [ ] publishedBefore
  - [x] q
  - [ ] regionCode
  - [ ] safeSearch
  - [ ] topicId
  - [ ] type
  - [ ] videoCaption
  - [ ] videoCategoryId
  - [ ] videoDefinition
  - [ ] videoDimension
  - [ ] videoDuration
  - [ ] videoEmbeddable
  - [ ] videoLicense
  - [ ] videoSyndicated
  - [ ] videoType

Subscriptions
-------------

- [x] Subscription resource ([docs](https://developers.google.com/youtube/v3/docs/subscriptions))
  - [x] kind
  - [ ] etag
  - [x] id (kind, videoId, channelId, playlistId)
  - [ ] snippet (publishedAt, channelTitle, title, description, resourceId, channelId, thumbnails)
  - [ ] contentDetails (totalItemCount, newItemCount, activityType)
  - [ ] subscriberSnippet (title, description, channelId, thumbnails)

- [ ] list
- [ ] insert
- [ ] delete

- [ ] Thumbnails
  - [ ] set
- [ ] VideoCategories
  - [ ] list
- [ ] Videos
  - [ ] list
  - [ ] insert
  - [ ] update
  - [ ] rate
  - [ ] getRating
  - [ ] delete
- [ ] Watermarks
  - [ ] set
  - [ ] unset