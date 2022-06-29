package org.upgrad.upstac.testrequests.lab;

import lombok.Data;

import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;

@Data
public class CreateLabResult {

    @NotNull
    private String bloodPressure;

    @NotNull
    private String heartBeat;
    @NotNull
    private String temperature;
    private String oxygenLevel;
    private String comments;
    @NotNull
    private TestStatus result;
    private LocalDate UpdateOn = LocalDate.now();
}
