/*
 * Copyright 2020-2022, Seqera Labs
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

package nextflow.cloud.google.batch

import com.google.cloud.batch.v1.Volume
import groovy.transform.Canonical

/**
 *
 * @author Paolo Di Tommaso <paolo.ditommaso@gmail.com>
 */
@Canonical
class GoogleBatchLauncherSpecMock implements GoogleBatchLauncherSpec {

    String runCommand
    List<String> containerMounts = List.of()
    List<Volume> volumes = List.of()
    Map<String,String> environment = Map.of()

    @Override
    List<String> getContainerMounts() {
        return containerMounts
    }

    @Override
    List<Volume> getVolumes() {
        return volumes
    }

    @Override
    String runCommand() {
        return runCommand
    }

    Map<String,String> getEnvironment() {
        return environment
    }
}
