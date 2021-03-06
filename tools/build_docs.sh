#!/bin/bash
#appledoc Xcode script

# Start constants
company="testpath1";
companyID="testpath2";
companyURL="http://www.cocos2d-swift.org";
target="iphoneos";
outputPath="api-docs";
atomfilename="cocos2d-swift.atom"
feedurl="${companyURL}/${company}/%DOCSETATOMFILENAME"
packageurl="${companyURL}/${company}/%DOCSETPACKAGEFILENAME"
fallbackurl="${companyURL}/${company}"
# End constants

# -q parameter "quickens" html doc generation by skipping the docsets (maybe 10% faster, not much)
docsets="--docset-atom-filename ${atomfilename} --docset-feed-url ${feedurl} --docset-package-url ${packageurl} --docset-fallback-url ${fallbackurl} --docset-platform-family ${target} --publish-docset --install-docset"

while getopts ":q" opt; do
	case $opt in
	q)
   		docsets=""
		;;
  esac
done

# Note about ignore list:
# You can use "--ignore Path" only to ignore files that *end in* Path
# You can't use "--ignore *Package*" (any wildcard combo) to ignore files that begin with or contain Path
# Ignore list is case-sensitive!

# --company-id "org" <-- This should be just "org", combined with project-name this creates the .docset filename

####################################
# Req: Please keep the ignore list sorted alphabetically.
####################################

tools/appledoc \
--project-name "Cocos2D-Swift v3.3" \
--project-company "v3.3" \
--company-id "org" \
${docsets} \
--output "${outputPath}" \
--logformat xcode \
--no-keep-undocumented-members \
--no-search-undocumented-doc \
--keep-intermediate-files \
--no-repeat-first-par \
--no-warn-invalid-crossref \
--merge-categories \
--no-merge-category-comment \
--prefix-merged-sections \
--warn-undocumented-object \
--warn-undocumented-member \
--warn-empty-description \
--warn-unknown-directive \
--warn-missing-arg \
--exit-threshold 2 \
--verbose 2 \
--index-desc API-Index.md \
--ignore .m \
--ignore _Private.h \
--ignore _frag.h \
--ignore _vert.h \
--ignore base64.h \
--ignore Cache.h \
--ignore CCActionManager.h \
--ignore CCAtlasNode.h \
--ignore CCBAnimationManager.h \
--ignore CCBKeyFrame.h \
--ignore CCBLocalizationManager.h \
--ignore CCBReader.h \
--ignore CCBSequence.h \
--ignore CCBSequenceProperty.h \
--ignore CCBuilderReader.h \
--ignore ccConfig.h \
--ignore CCConfiguration.h \
--ignore ccDeprecated.h \
--ignore CCDirectorIOS.h \
--ignore CCDirectorMac.h \
--ignore CCDrawingPrimitives.h \
--ignore CCEffectDistanceField.h \
--ignore CCES2Renderer.h \
--ignore CCESRenderer.h \
--ignore ccFPSImages.h \
--ignore CCGL.h \
--ignore CCGLProgram.h \
--ignore CCGLView.h \
--ignore CCLabelAtlas.h \
--ignore ccMacros.h \
--ignore CCMetalView.h \
--ignore CCNS.h \
--ignore CCPackageCocos2dEnabler.h \
--ignore CCPackageDownload.h \
--ignore CCPackageDownloadDelegate.h \
--ignore CCPackageDownloadManager.h \
--ignore CCPackageDownloadManagerDelegate.h \
--ignore CCPackageInstaller.h \
--ignore CCPackageTypes.h \
--ignore CCPackageUnzipper.h \
--ignore CCPackageUnzipperDelegate.h \
--ignore CCParticleBatchNode.h \
--ignore CCPhysics+ObjectiveChipmunk.h \
--ignore CCProfiling.h \
--ignore CCProtocols.h \
--ignore CCResponderManager.h \
--ignore ccShaders.h \
--ignore CCSpriteBatchNode.h \
--ignore CCTextureAtlas.h \
--ignore CCTexturePVR.h \
--ignore CCTouchAndroid.h \
--ignore ccUtils.h \
--ignore CCVertex.h \
--ignore CCWindow.h \
--ignore CGPointExtension.h \
--ignore cocos2d-ui.h \
--ignore cocos2d.h \
--ignore NSAttributedString+CCAdditions.h \
--ignore NSThread+performBlock.h \
--ignore NSValue+CCRenderer.h \
--ignore OpenGL_Internal.h \
--ignore TGAlib.h \
--ignore TransformUtils.h \
--ignore UITouch+CC.h \
--ignore uthash.h \
--ignore utlist.h \
--ignore ZipUtils.h \
cocos2d \
cocos2d-ui \
external/ObjectAL/ObjectAL/ObjectAL/OALSimpleAudio.h \
external/ObjectAL/ObjectAL/ObjectAL/AudioTrack \
external/ObjectAL/ObjectAL/ObjectAL/Session \
