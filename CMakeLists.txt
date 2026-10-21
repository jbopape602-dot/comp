cmake_minimum_required(VERSION 3.22)
project(NAT2MADE_COMP VERSION 0.1.0)

# JUCE is fetched at configure time. Internet access is required the first time.
include(FetchContent)
FetchContent_Declare(JUCE
    GIT_REPOSITORY https://github.com/juce-framework/JUCE.git
    GIT_TAG 8.0.6
    GIT_SHALLOW TRUE)
FetchContent_MakeAvailable(JUCE)

juce_add_plugin(NAT2MADE_COMP
    COMPANY_NAME "NAT2MADE"
    BUNDLE_ID "com.nat2made.comp"
    PLUGIN_MANUFACTURER_CODE N2Md
    PLUGIN_CODE N2Cp
    FORMATS VST3 Standalone
    PRODUCT_NAME "NAT2MADE COMP"
    IS_SYNTH FALSE
    NEEDS_MIDI_INPUT FALSE
    NEEDS_MIDI_OUTPUT FALSE
    IS_MIDI_EFFECT FALSE
    EDITOR_WANTS_KEYBOARD_FOCUS FALSE
    COPY_PLUGIN_AFTER_BUILD TRUE
)

target_sources(NAT2MADE_COMP PRIVATE
    Source/PluginProcessor.cpp
    Source/PluginProcessor.h
    Source/PluginEditor.cpp
    Source/PluginEditor.h)

target_compile_features(NAT2MADE_COMP PRIVATE cxx_std_17)
target_compile_definitions(NAT2MADE_COMP PUBLIC
    JUCE_WEB_BROWSER=0
    JUCE_USE_CURL=0
    JUCE_VST3_CAN_REPLACE_VST2=0)
target_link_libraries(NAT2MADE_COMP PRIVATE
    juce::juce_audio_utils
    juce::juce_dsp
    PUBLIC juce::juce_recommended_config_flags
           juce::juce_recommended_lto_flags
           juce::juce_recommended_warning_flags)
