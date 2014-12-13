# -*- coding: utf-8 -*-
from libcpp cimport bool
from .defs cimport *
from .geometry cimport *
from .unicodestring cimport *

cdef extern from "slapi/model/model.h":
    enum SUEntityType "SUModelStatistics::SUEntityType":
        SUEntityType_Edge = 0,
        SUEntityType_Face
        SUEntityType_ComponentInstance
        SUEntityType_Group
        SUEntityType_Image
        SUEntityType_ComponentDefinition
        SUEntityType_Layer
        SUEntityType_Material
        SUNumEntityTypes

    struct SUModelStatistics:
        int entity_counts[<int>SUNumEntityTypes]

    enum SUModelUnits:
        SUModelUnits_Inches,
        SUModelUnits_Feet,
        SUModelUnits_Millimeters,
        SUModelUnits_Centimeters,
        SUModelUnits_Meters


    enum SUModelVersion:
        SUModelVersion_SU3,
        SUModelVersion_SU4,
        SUModelVersion_SU5,
        SUModelVersion_SU6,
        SUModelVersion_SU7,
        SUModelVersion_SU8,
        SUModelVersion_SU2013,
        SUModelVersion_SU2014,
        SUModelVersion_SU2015

    SU_RESULT SUModelCreate(SUModelRef* model)
    SU_RESULT SUModelCreateFromFile(SUModelRef* model, const char* file_path)
    SU_RESULT SUModelRelease(SUModelRef* model)
    SU_RESULT SUModelGetEntities(SUModelRef model, SUEntitiesRef* entities)
    SU_RESULT SUModelGetNumMaterials(SUModelRef model, size_t* count)
    SU_RESULT SUModelGetMaterials(SUModelRef model, size_t len, SUMaterialRef materials[], size_t* count)
    SU_RESULT SUModelAddMaterials(SUModelRef model, size_t len, const SUMaterialRef materials[])
    SU_RESULT SUModelGetNumComponentDefinitions(SUModelRef model, size_t* count)
    SU_RESULT SUModelGetComponentDefinitions(SUModelRef model, size_t len, SUComponentDefinitionRef components[], size_t* count)
    SU_RESULT SUModelAddComponentDefinitions(SUModelRef model, size_t len, const SUComponentDefinitionRef components[])
    SU_RESULT SUModelSaveToFile(SUModelRef model, const char* file_path)
    SU_RESULT SUModelSaveToFileWithVersion(SUModelRef model, const char* file_path, SUModelVersion version)
    SU_RESULT SUModelGetCamera(SUModelRef model, SUCameraRef* camera)
    SU_RESULT SUModelGetNumScenes(SUModelRef model, size_t* num_scenes)
    SU_RESULT SUModelGetNumLayers(SUModelRef model, size_t* count)
    SU_RESULT SUModelGetLayers(SUModelRef model, size_t len, SULayerRef layers[], size_t* count)
    SU_RESULT SUModelAddLayers(SUModelRef model, size_t len, const SULayerRef layers[])
    SU_RESULT SUModelGetDefaultLayer(SUModelRef model, SULayerRef* layer)
    SU_RESULT SUModelGetVersion(SUModelRef model, int* major, int* minor, int* build)
    SU_RESULT SUModelGetNumAttributeDictionaries(SUModelRef model, size_t* count)
    SU_RESULT SUModelGetAttributeDictionaries(SUModelRef model, size_t len, SUAttributeDictionaryRef dictionaries[], size_t* count)
    SU_RESULT SUModelGetAttributeDictionary(SUModelRef model, const char* name, SUAttributeDictionaryRef* dictionary)
    SU_RESULT SUModelGetLocation(SUModelRef model, SULocationRef* location)
    SU_RESULT SUModelGetStatistics(SUModelRef model, SUModelStatistics* statistics)
    SU_RESULT SUModelSetGeoReference(SUModelRef model, double latitude, double longitude, double altitude, bool is_z_value_centered, bool is_on_ocean_floor)
    SU_RESULT SUModelGetRenderingOptions(SUModelRef model, SURenderingOptionsRef* rendering_options)
    SU_RESULT SUModelGetShadowInfo(SUModelRef model, SUShadowInfoRef* shadow_info)
    SU_RESULT SUModelGetOptionsManager(SUModelRef model, SUOptionsManagerRef* options_manager)
    SU_RESULT SUModelGetNorthCorrection(SUModelRef model, double* north_correction)
    SU_RESULT SUModelMergeCoplanarFaces(SUModelRef model)
    SU_RESULT SUModelGetScenes(SUModelRef model, size_t len, SUSceneRef scenes[], size_t* count)
    SU_RESULT SUModelAddScenes(SUModelRef model, size_t len, const SUSceneRef scenes[])
    SU_RESULT SUModelAddMatchPhotoScene(SUModelRef model, const char* image_file, SUCameraRef camera, const char* scene_name, SUSceneRef *scene)
    SU_RESULT SUModelGetName(SUModelRef model, SUStringRef* name)
    SU_RESULT SUModelSetName(SUModelRef model, const char* name)
    SU_RESULT SUModelGetUnits(SUModelRef model, SUModelUnits* units)
    SU_RESULT SUModelGetClassifications(SUModelRef model, SUClassificationsRef* classifications)