Pod::Spec.new do |s|
  s.name= "ReactiveCocoa"
  s.version= "2.3.1"
  s.summary= "A framework for composing and transforming streams of values."
  s.homepage= "https://github.com/blog/1107-reactivecocoa-is-now-open-source"
  s.authors= {
    "Josh Abernathy"=> "josh@github.com"
  }
  s.source= {
    :git => "https://github.com/zengql512/ReactiveCocoa.git",
    :tag => "v2.3.1"
  }
  s.license= "MIT"
  s.description= "ReactiveCocoa (RAC) is an Objective-C framework for Functional Reactive Programming. It provides APIs for composing and transforming streams of values."
  s.requires_arc= true,
  s.platforms= {
    :"ios"=> "5.0",
    :"osx"=> "10.7"
  }
  s.compiler_flags= "-DOS_OBJECT_USE_OBJC=0"
  s.prepare_command= "    find . \\( -regex '.*EXT.*\\.[mh]$' -o -regex '.*metamacros\\.[mh]$' \\) -execdir mv {} RAC{} \\;\n    find . -regex '.*\\.[hm]' -exec sed -i '' -E 's@\"(EXT.*|metamacros)\\.h\"@\"RAC\\1.h\"@' {} \\;\n    find . -regex '.*\\.[hm]' -exec sed -i '' -E 's@<ReactiveCocoa/(EXT.*)\\.h>@<ReactiveCocoa/RAC\\1.h>@' {} \\;\n"
  s.default_subspec= "UI"
  s.subspec 'General' do |general|      
    general.subspec 'no-arc' do |noarc|
      noarc.source_files= "ReactiveCocoaFramework/ReactiveCocoa/RACObjCRuntime.{h,m}"
      noarc.requires_arc= false
    end
    general.subspec 'Core' do |core|
      # core.dependencies= "ReactiveCocoa/no-arc"
      core.source_files= "ReactiveCocoaFramework/ReactiveCocoa/**/*.{d,h,m}"
      core.private_header_files= "**/*Private.h", "**/*EXTRuntimeExtensions.h"
      core.exclude_files= "ReactiveCocoaFramework/ReactiveCocoa/**/*{RACObjCRuntime,AppKit,NSControl,NSText,NSTable,UIActionSheet,UIAlertView,UIBarButtonItem,UIButton,UICollectionReusableView,UIControl,UIDatePicker,UIGestureRecognizer,UIImagePicker,UIRefreshControl,UISegmentedControl,UISlider,UIStepper,UISwitch,UITableViewCell,UITableViewHeaderFooterView,UIText}*"
      core.header_dir= "ReactiveCocoa"
    end
    general.subspec 'UI' do |ui|
      # ui.dependencies= "ReactiveCocoa/no-arc"
      ui.source_files= "ReactiveCocoaFramework/ReactiveCocoa/**/*{AppKit,NSControl,NSText,NSTable,UIActionSheet,UIAlertView,UIBarButtonItem,UIButton,UICollectionReusableView,UIControl,UIDatePicker,UIGestureRecognizer,UIImagePicker,UIRefreshControl,UISegmentedControl,UISlider,UIStepper,UISwitch,UITableViewCell,UITableViewHeaderFooterView,UIText}*"
      # ui.osx= {
#         "exclude_files"=> "ReactiveCocoaFramework/ReactiveCocoa/**/*{UIActionSheet,UIAlertView,UIBarButtonItem,UIButton,UICollectionReusableView,UIControl,UIDatePicker,UIGestureRecognizer,UIImagePicker,UIRefreshControl,UISegmentedControl,UISlider,UIStepper,UISwitch,UITableViewCell,UITableViewHeaderFooterView,UIText}*.{d,h,m}"
#       }
      ui.ios.exclude_files= "ReactiveCocoaFramework/ReactiveCocoa/**/*{AppKit,NSControl,NSText,NSTable}*.{d,h,m}"
      ui.header_dir= "ReactiveCocoa"
    end
  end
end