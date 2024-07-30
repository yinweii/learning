package com.gnof.tipapp.widgets

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material3.ButtonElevation
import androidx.compose.material3.Card
import androidx.compose.material3.MaterialTheme
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.Icon
import androidx.compose.ui.Alignment

val IconButonSizeModifier = Modifier.size(40.dp)
@Composable
fun RoundIconButton(
    modifier : Modifier = Modifier,
    imageVector: ImageVector,
    onClick:() -> Unit,
    tint: Color = Color.Black.copy(alpha = 0.8f),
    backGroundColor: Color = MaterialTheme.colorScheme.background,
    elevation: Dp = 4.dp,
) {
    Card(
        modifier = modifier
            .padding(all = 4.dp)
            .clickable { onClick.invoke() }
            .then(IconButonSizeModifier),
        shape = CircleShape,
        colors =  CardDefaults.cardColors(containerColor = backGroundColor),
        elevation = CardDefaults.cardElevation(defaultElevation = elevation)
    ) {
        Box ( modifier = Modifier.fillMaxSize(),
            contentAlignment = Alignment.Center) {
            Icon(imageVector = imageVector , contentDescription = "Plus or minus icon", tint = tint, modifier = modifier)
        }
//

    }
}